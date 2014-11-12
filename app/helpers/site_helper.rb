module SiteHelper
  def donate_link(text="Donate")
    email = "rz+actondogpark@eqdw.net"
    cc    = "cash@square.com"
    body = <<-EMAIL
Put the dollar amount that you would like to donate in the subject line. For example, to put a dollar into the Bones for Oreo fund, put "$1" (without the quotes) into the subject line.

Incidentally, if you're unaware: this is using Square Cash. After sending this email, you'll get another email from them asking you to put in your debit (no credit, sorry) card info. If you're curious, check out https://square.com/cash. They'll even send you a dollar as a demo!

Also, feel free to delete this message body, and replace it with a friendly "Hello!". Or just say hi the next time we're down at the dog park. 
    EMAIL

    mailto = "mailto:#{email}?cc=#{cc}&body=#{body}"

    link_to text, mailto
  end
end
