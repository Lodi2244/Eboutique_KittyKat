class MailerLauncher

  def mailer

    @mailer = Mailjet::Send.create(messages: [{
      'From'=> {
          'Email'=> 'roxy.foxy2244@gmail.com',
          'Name'=> 'Roxanne Tellier'
      },
      'To'=> [
          {
              'Email'=> 'elodieletellier1@gmail.com',
              'Name'=> 'Elo'
          }
      ],
      'Subject'=> 'Your email flight plan!',
      'TextPart'=> 'Dear passenger 1, welcome to Mailjet! May the delivery force be with you!',
      'HTMLPart'=> '<h3>Dear passenger 1, welcome to Mailjet!</h3><br />May the delivery force be with you!'
  }]
  )
  p @mailer.attributes['Messages']

  end
end

MailerLauncher.mailer.deliver_now!
