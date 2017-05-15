module StaffHelper
  def getStatusOption
    return {
      '管理者権限': 1,
      '閲覧権限': 2,
      '書き込み権限': 3
    };
  end
end
