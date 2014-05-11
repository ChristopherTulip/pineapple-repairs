(function() {
  $(function() {
    var StagesArray, SurveyData, getAnswerObject, getStage, loadInNewQuestion, navigateToSignUp, saveAnswerObject, updateButtons, updateDisplayedAnswers, updatePageText, updateQuestionProgressBar, updateStageProgressBar;
    SurveyData = {};
    StagesArray = ['genetic', 'health', 'lifestyle'];
    $('.survey-answer').click(function() {
      var $this, answer, checkedSrc, uncheckedSrc;
      $this = $(this);
      answer = $this.data('answer');
      checkedSrc = $('#survey-answers').data('checked-src');
      uncheckedSrc = $('#survey-answers').data('unchecked-src');
      $('#submit-answer').attr('disabled', false);
      $('#input-survey-answer').val(answer);
      $('.tickbox img').attr('src', uncheckedSrc);
      return $this.find('.tickbox img').attr('src', checkedSrc);
    });
    getStage = function() {
      var answerObject, stageNumber;
      answerObject = getAnswerObject();
      stageNumber = answerObject.stage;
      return StagesArray[stageNumber];
    };
    $('#survey-back').click(function(event) {
      var answerObject, backQuestionNumber, stage;
      event.preventDefault();
      answerObject = getAnswerObject();
      stage = getStage();
      if (answerObject[stage].length > 0) {
        answerObject[stage].pop();
        console.log(answerObject[stage]);
        saveAnswerObject(answerObject);
        backQuestionNumber = answerObject[stage].length;
        return loadInNewQuestion(backQuestionNumber);
      }
    });
    $('#survey-form').submit(function(event) {
      var answerObject, stage, userAnswer;
      event.preventDefault();
      userAnswer = $('#input-survey-answer').val();
      answerObject = getAnswerObject();
      stage = getStage();
      answerObject[stage].push(userAnswer);
      saveAnswerObject(answerObject);
      return loadInNewQuestion();
    });
    loadInNewQuestion = function(questionNumber) {
      var answerObject, answers, instructions, numOfUserAnswers, question, questionText, stage, survey, totalQuestions;
      answerObject = getAnswerObject();
      stage = getStage();
      survey = SurveyData[stage];
      console.log(stage);
      numOfUserAnswers = answerObject[stage];
      if (!questionNumber) {
        questionNumber = numOfUserAnswers.length;
      }
      totalQuestions = survey.questions.length - 1;
      console.log(questionNumber);
      console.log(totalQuestions);
      if (questionNumber > totalQuestions) {
        if (answerObject.stage === StagesArray.length - 1) {
          navigateToSignUp();
        }
        answerObject.stage += 1;
        saveAnswerObject(answerObject);
        questionNumber = 0;
        stage = getStage();
        survey = SurveyData[stage];
      }
      instructions = survey.instructions;
      question = survey.questions[questionNumber];
      questionText = question.question;
      answers = question.answers;
      if (answerObject.stage !== 0 || questionNumber !== 0) {
        $('#survey-title').hide();
      }
      updateDisplayedAnswers(answers);
      updateQuestionProgressBar(questionNumber, totalQuestions);
      updateButtons(questionNumber, totalQuestions);
      updatePageText(instructions, questionText);
      return updateStageProgressBar(stage);
    };
    navigateToSignUp = function() {
      var signUpUrl;
      signUpUrl = $('#survey-form').attr('sign_up_url');
      return document.location.url = signUpUrl;
    };
    updateStageProgressBar = function(stage) {
      var currentStageNumber, eachStage, i, previousStageNumber;
      currentStageNumber = StagesArray.indexOf(stage);
      i = 0;
      while (i <= currentStageNumber) {
        eachStage = StagesArray[i];
        $('.' + eachStage).removeClass('disabled');
        i++;
      }
      console.log(stage);
      previousStageNumber = StagesArray.indexOf(stage) - 1;
      if (previousStageNumber >= 0) {
        $('#progress').attr('data-stage', stage);
        return console.log(stage);
      }
    };
    updateDisplayedAnswers = function(answers) {
      return $('.survey-answer').each(function(index) {
        var $this, uncheckedSrc;
        $this = $(this);
        uncheckedSrc = $('#survey-answers').data('unchecked-src');
        $this.find('.tickbox img').attr('src', uncheckedSrc);
        if (answers[index]) {
          return $this.show().find('.survey-answer-text').text(answers[index]);
        } else {
          return $this.hide();
        }
      });
    };
    updatePageText = function(instructions, questionText, stage) {
      $('#survey-instructions').text(instructions);
      return $('.survey-question').text(questionText);
    };
    updateQuestionProgressBar = function(questionNumber, totalQuestions) {
      var progress;
      progress = (questionNumber / totalQuestions) * 100 + '%';
      return $('.question-progress-filler').css('width', progress);
    };
    updateButtons = function(questionNumber, totalQuestions) {
      var numberOfStages, stage, stageNumber;
      $('#input-survey-answer').val('');
      stage = getStage();
      stageNumber = StagesArray.indexOf(stage);
      numberOfStages = StagesArray.length;
      console.log(stageNumber);
      console.log(numberOfStages);
      if (questionNumber === totalQuestions) {
        if (stageNumber === numberOfStages - 1) {
          console.log('oh');
        }
        return $('#submit-answer').val('Submit Surveys');
      } else {
        if (questionNumber === 0) {
          $('#survey-back').hide();
        } else {
          $('#survey-back').show();
        }
        return $('#submit-answer').val('Next').attr('disabled', true);
      }
    };
    saveAnswerObject = function(answerObject) {
      return localStorage.setItem('answerObject', JSON.stringify(answerObject));
    };
    getAnswerObject = function() {
      var answerObject;
      answerObject = localStorage.getItem('answerObject');
      if (!answerObject) {
        answerObject = {
          stage: 0,
          genetic: [],
          health: [],
          lifestyle: []
        };
        localStorage.setItem('answerObject', JSON.stringify(answerObject));
      } else {
        answerObject = JSON.parse(answerObject);
      }
      return answerObject;
    };
    return $.ajax({
      url: '/survey.json',
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        SurveyData = data;
        return loadInNewQuestion();
      },
      error: function(data) {
        return console.log('error');
      }
    });
  });

}).call(this);
