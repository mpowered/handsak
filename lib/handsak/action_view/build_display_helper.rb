module BuildDisplayHelper  
  def build_footer
    <<-EOS
      <style TYPE="text/css">
      <!--
        #build_footer {
          color: #bbb;
          font-size: 0.95em;
        }
        -->
       </style>
       <div id='build_footer'>#{`git log -n 1 --pretty=format:'%d %h: %s - %cn - %ad' --date=relative`}</div>
    EOS
    .html_safe
  end
end

ActionView::Base.send(:include, BuildDisplayHelper)