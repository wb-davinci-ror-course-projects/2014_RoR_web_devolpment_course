module ApplicationHelper

def times
  "&times;".html_safe
end

def divide
  "&divide;".html_safe
end
   
def logo
  image_tag "logo.png"
end

def big_submit_tag
"<div class='form-group'>
  #{submit_tag "Submit", class: "btn btn-primary btn-lg btn-block"}
</div>".html_safe
end

def volume_control(position)
"<button class='btn btn-default'>
  <span class='glyphicon glyphicon-volume-#{position}'></span>
</button>".html_safe
end

def full_name(user_variable)
  "#{user_variable.first_name} #{user_variable.last_name}"
end

def format_date(date)
    date.strftime('%Y-%m-%d')
  end
def under_age(age)
  "<span class='under-21'>#{age}</span>".html_safe
end

def age_calc x, y
 (x - y).to_i / 365
end

def nav_helper x, y
  "<li class='pull-right #{if params[:action] == "#{x}" then "active" end}'>
    <a href='/#{x}'>#{y}</a></li>".html_safe
end

def tag_helper x
"<div class='form-group'>
  #{label_tag :"#{x}", nil, class: 'col-sm-2 control-label'}
    <div class='col-sm-10'>
      #{text_field_tag :"#{x}", '', class: 'form-control col-sm-10'}
    </div>
 </div>".html_safe
end
def check_helper x
  "<div class='form-group'>
    <div class='col-sm-offset-2 col-sm-10'>
      <div class='checkbox'>
        #{check_box_tag :"#{x}"}
        #{label_tag :"#{x}"}
      </div>
    </div>
  </div>".html_safe
end

def submit_helper
"<div class='form-group'>
  <div class='col-sm-offset-2 col-sm-10'>
    #{submit_tag "Submit", class: "btn btn-primary"}
  </div>
</div>".html_safe
end

def label_text_tag x
"<div class='form-group'>
  #{label_tag :"#{x}"}
  #{text_field_tag :"#{x}", '', class: 'form-control'}
</div>".html_safe
end

def checkbox_helper x, y
"<div class='checkbox'>
    #{check_box_tag :"#{x}"}
    #{label_tag :"#{x}", "#{y}"}
  </div>".html_safe
end

def class_helper x, y, z
"<div class='form-group'>
  #{label_tag :"#{x}"}
  #{select_tag :"#{x}", options_for_select(y),
    prompt: "#{z}", class: "form-control"}
</div>".html_safe
end
def radio_helper x
  "<div class='radio'>
    #{radio_button_tag :gender, :"#{x}"}
    #{label_tag :"gender_#{x}", "#{x.capitalize}"}
  </div>".html_safe
end

end
