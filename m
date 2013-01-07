Received: from o.ww.redhat.com (vpn1-7-244.ams2.redhat.com [10.36.7.244])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r07ICG3j014557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2013 13:12:17 -0500
Message-ID: <50EB0FB6.8070105@redhat.com>
Date: Mon, 07 Jan 2013 19:11:02 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <20130101220727.GA32103@iss.tu-darmstadt.de>
In-Reply-To: <20130101220727.GA32103@iss.tu-darmstadt.de>
Content-Type: multipart/alternative;
	boundary="------------080808090702010107010709"
Subject: Re: [linux-lvm] howto avoid initializing a particular volume-group
 at boot time?
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
--------------080808090702010107010709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2013 11:07 PM, Tom Assmuth wrote:
> hi and best wishes for the new year!
>   
> Let me describe my scenario: I have a big volume group (let's say:
> /dev/vgbig/lv[1-9]) with a lot of snapshots in it and not used very
> often. Another volume group (/dev/vgsmall/lv[1-9]) contains data for
> normal use.
>
> Because of initializing /dev/vgbig/ at boot time the machine becomes
> usable after about 12h (twelve!)
>
> It would be ok if the machine would boot with /dev/vgsmall
> initialized, would do it's normal duty and in an late initscript would
> initialize /dev/vgbig/ (vgchange -ay /dev/vgbig/ ) It would be ok to
> wait now, because i could do my normal work.
>
> I thougt about a rule in /etc/lvm/lvm.conf, but i am not sure how to
> write it.

Got dracut?

Then kernel command line arg

*rd.lvm.vg=*_<volume_  _group_  _name>

_would do._

Heinz
_

>
> Does anyone? Thanks in advance, tom
>


--------------080808090702010107010709
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 01/01/2013 11:07 PM, Tom Assmuth wrote:<br>
    <blockquote cite="mid:20130101220727.GA32103@iss.tu-darmstadt.de"
      type="cite">
      <pre wrap="">hi and best wishes for the new year!
 
Let me describe my scenario: I have a big volume group (let's say:
/dev/vgbig/lv[1-9]) with a lot of snapshots in it and not used very
often. Another volume group (/dev/vgsmall/lv[1-9]) contains data for
normal use.

Because of initializing /dev/vgbig/ at boot time the machine becomes
usable after about 12h (twelve!)

It would be ok if the machine would boot with /dev/vgsmall
initialized, would do it's normal duty and in an late initscript would
initialize /dev/vgbig/ (vgchange -ay /dev/vgbig/ ) It would be ok to
wait now, because i could do my normal work.

I thougt about a rule in /etc/lvm/lvm.conf, but i am not sure how to
write it.</pre>
    </blockquote>
    <br>
    Got dracut?<br>
    <br>
    Then kernel command line arg<br>
    <pre><b>rd.lvm.vg=</b><u>&lt;volume</u> <u>group</u> <u>name&gt;

</u>would do.<u>

Heinz
</u></pre>
    <blockquote cite="mid:20130101220727.GA32103@iss.tu-darmstadt.de"
      type="cite">
      <pre wrap="">

Does anyone? Thanks in advance, tom 

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080808090702010107010709--
