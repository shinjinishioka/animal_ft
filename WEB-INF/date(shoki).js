/**
 * �C�x���g��o�^����iIE8�ȉ��� addEventListener() �ɑΉ����Ă��Ȃ����߂̃��b�p�[�֐��j
 *
 * @param t �Ώۃm�[�h
 * @param p �C�x���g�^�C�v
 * @param l ���s�����֐�
 */
var _addEvent=function(t,p,l){try{t.addEventListener(p,l,false);}catch(e){t.attachEvent("on"+p,function(e){l.call(t,e);});}};

(function(){
  _addEvent(window, "load", function(e) {
    var yearId = "year"; // �N�R���g���[����ID
    var monthId = "month"; // ���R���g���[����ID
    var dayId = "day"; // ���R���g���[����ID

    var targetYear = document.getElementById(yearId);
    var targetMonth = document.getElementById(monthId);
    var targetDay = document.getElementById(dayId);

    _addEvent(targetYear, "change", function(e) {
      // �N�R���g���[����ύX�����Ƃ�
      nonExistDayIsNonDisplayed(this, targetMonth, targetDay);
    });
    _addEvent(targetMonth, "change", function(e) {
      // ���R���g���[����ύX�����Ƃ�
      nonExistDayIsNonDisplayed(targetYear, this, targetDay);
    });
  });

  /**
   * ���݂��Ȃ����i2��30���Ȃǁj�̑I�������\���ɂ���
   *
   * @param targetYear �N�R���g���[��
   * @param targetMonth ���R���g���[��
   * @param targetDay ���R���g���[��
   */
  var nonExistDayIsNonDisplayed = function(targetYear, targetMonth, targetDay) {
    var selectedMonthValue = parseInt(targetMonth.getElementsByTagName("option")[targetMonth.selectedIndex].value, 10);
    var targetDayOptions = targetDay.getElementsByTagName("option");

    if (selectedMonthValue === 2) {
      // 2���̏ꍇ
      var selectedYearValue = parseInt(targetYear.getElementsByTagName("option")[targetYear.selectedIndex].value, 10)
      var leapYear = isLeapYear(selectedYearValue); // �[�N��

      for (var i = targetDayOptions.length - 1; i >= 0; i--) {
        var targetDayOption = targetDayOptions[i];
        var dayValue = parseInt(targetDayOption.value, 10);
        if (dayValue >= 30 || (dayValue === 29 && !leapYear)) {
          targetDayOption.disabled = true; // �I��s�\�w��
          if (targetDayOption.selected) {
            // 29��(�[�N�łȂ��ꍇ�̂�)�A30���A31���̂����ꂩ���I������Ă����ꍇ�́A2���̍ŏI���ɕύX
            if (leapYear) {
              targetDay.value = "29";
            } else {
              targetDay.value = "28";
            }
          }
        } else if (targetDayOption.disabled) {
          // �I��s�\�w�肪������Ă��������
          targetDayOption.disabled = false;
        } else {
          break;
        }
      }
    } else if (selectedMonthValue === 4 || selectedMonthValue === 6 || selectedMonthValue === 9 || selectedMonthValue === 11) {
      // ���̓�����30���̏ꍇ
      for (var i = targetDayOptions.length - 1; i >= 0; i--) {
        var targetDayOption = targetDayOptions[i];
        var dayValue = parseInt(targetDayOption.value, 10);
        if (dayValue >= 31) {
          targetDayOption.disabled = true; // �I��s�\�w��
          if (targetDayOption.selected) {
            // 31�����I������Ă����ꍇ�́A�e���̍ŏI���ɕύX
            targetDay.value = "30";
          }
        } else if (targetDayOption.disabled) {
          // �I��s�\�w�肪������Ă��������
          targetDayOption.disabled = false;
        } else {
          break;
        }
      }
    } else {
      // ���̓�����31���̏ꍇ
      for (var i = targetDayOptions.length - 1; i >= 0; i--) {
        var targetDayOption = targetDayOptions[i];
        if (targetDayOption.disabled) {
          // �I��s�\�w�肪������Ă��������
          targetDayOption.disabled = false;
        } else {
          break;
        }
      }
    }
  };

  /**
   * �[�N��
   *
   * @param year �N
   *
   * @return �[�N�Ȃ�true�A����ȊO�̏ꍇ��false
   */
  var isLeapYear = function(year) {
    return new Date(year, 1, 29).getMonth() === 1;
  };
})();