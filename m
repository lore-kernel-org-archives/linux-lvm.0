Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4KLdaoe015535
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 17:39:37 -0400
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4KLdZYl011131
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 17:39:36 -0400
Message-ID: <4FB96496.70404@earthlink.net>
Date: Sun, 20 May 2012 17:39:34 -0400
From: Raptorfan <raptorfan@earthlink.net>
MIME-Version: 1.0
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
In-Reply-To: <CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------030101050703070000060404"
Subject: Re: [linux-lvm] lvreduce nightmare
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

This is a multi-part message in MIME format.
--------------030101050703070000060404
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 5/18/2012 10:13 AM, tariq wali wrote:
> so to i guess to do this right i should have
> resize2fs /dev/vg0/data 1.6T or (1600G
> and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by
100 )

This is probably a nit-picking.. but seriously consider picking a single
numeric selection for both operations. Either run both commands with an
absolute value (preferable in my opinion; there is NO QUESTION at that
point what your final state should be) or with the delta value. Mixing
both in the commands is another way to confuse what you actually want to
accomplish. If you'd used absolute values to start with there probably
would have been a reduced chance of failure (barring a typo.. though you
still need to verify the resize2fs command completed successfully before
doing the lvreduce).

-r


--------------030101050703070000060404
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 5/18/2012 10:13 AM, tariq wali wrote:<br>
    <span style="white-space: pre;">&gt; so to i guess to do this right
      i should have <br>
      &gt; resize2fs /dev/vg0/data 1.6T or (1600G<br>
      &gt; and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce
      the lvm by 100 ) </span><br>
    <br>
    This is probably a nit-picking.. but seriously consider picking a
    single numeric selection for both operations. Either run both
    commands with an absolute value (preferable in my opinion; there is
    NO QUESTION at that point what your final state should be) or with
    the delta value. Mixing both in the commands is another way to
    confuse what you actually want to accomplish. If you'd used absolute
    values to start with there probably would have been a reduced chance
    of failure (barring a typo.. though you still need to verify the
    resize2fs command completed successfully before doing the lvreduce).<br>
    <br>
    -r<br>
    <br>
  </body>
</html>

--------------030101050703070000060404--
