Received: from o.ww.redhat.com (vpn1-7-24.ams2.redhat.com [10.36.7.24])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r759sRio009243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Aug 2013 05:54:31 -0400
Message-ID: <51FF760C.3080508@redhat.com>
Date: Mon, 05 Aug 2013 11:53:16 +0200
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com>
In-Reply-To: <CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------040708010009040805040607"
Subject: Re: [linux-lvm] Linux LVM online shrinking :(
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------040708010009040805040607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/01/2013 11:00 AM, DILIP KURUMANGHAT wrote:
> Hi Team,
>
> You might already have come across this stuff many a times.
>
> I am sending this query as to why LVM is not supporting online shrink.
> How is that AIX can do the shrink but not in our best Linux.

Hi,

how do you come to this conclusion?

LVM supports online shrinking of logical volumes since LVM1 got 
introduced back in 1997?

Maybe you're confusing this with filesystens or applications string data 
on logical volumes
not being able to online shrink?

>
> Is there a big difference i the underlying architecture which prevents 
> us from an online shrink?

No.

Heinz

>
> Thanks and regards,
> DILIP K
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------040708010009040805040607
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 08/01/2013 11:00 AM, DILIP
      KURUMANGHAT wrote:<br>
    </div>
    <blockquote
cite="mid:CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>Hi Team,<br>
                <br>
              </div>
              You might already have come across this stuff many a
              times.<br>
            </div>
            <br>
          </div>
          I am sending this query as to why LVM is not supporting online
          shrink.<br>
        </div>
        How is that AIX can do the shrink but not in our best Linux.<br
          clear="all">
      </div>
    </blockquote>
    <br>
    Hi,<br>
    <br>
    how do you come to this conclusion?<br>
    <br>
    LVM supports online shrinking of logical volumes since LVM1 got
    introduced back in 1997?<br>
    <br>
    Maybe you're confusing this with filesystens or applications string
    data on logical volumes<br>
    not being able to online shrink?<br>
    <br>
    <blockquote
cite="mid:CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>
                <div>
                  <div><br>
                    <div>Is there a big difference i the underlying
                      architecture which prevents us from an online
                      shrink?<br>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    No.<br>
    <br>
    Heinz<br>
    <br>
    <blockquote
cite="mid:CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>
                <div>
                  <div>
                    <div><br>
                      Thanks and regards,<br>
                      DILIP K</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040708010009040805040607--
