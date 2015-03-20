module MobsHelper
  def base_rate
    cookies[:base_mod].present? ? cookies[:base_mod].to_i : 1
  end

  def job_rate
    cookies[:job_mod].present? ? cookies[:job_mod].to_i : 1
  end

  def drop_rate
    cookies[:drop_mod].present? ? cookies[:drop_mod].to_i : 1
  end

  def apply_base_rate(exp)
     exp * base_rate
  end

  def apply_job_rate(exp)
    exp * job_rate
  end

  def apply_drop_rate(chance)
    [chance * drop_rate, 100].min
  end

  def is_renewal
    false
  end

  def drop_fraction(val)
    val.to_i == val ? val.to_i : val
  end
end
