Received: from [10.40.200.22] (ovpn-200-22.brq.redhat.com [10.40.200.22])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23INs2t031100
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2016 13:23:55 -0500
References: <20160303132849.C8F8713A0E65@snark.thyrsus.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56D8813A.1080506@redhat.com>
Date: Thu, 3 Mar 2016 19:23:54 +0100
MIME-Version: 1.0
In-Reply-To: <20160303132849.C8F8713A0E65@snark.thyrsus.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems in lvm.8
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 3.3.2016 v 14:28 esr@thyrsus.com napsal(a):
> This is automatically generated email about markup problems in a man
> page for which you appear to be responsible.  If you are not the right
> person or list, please tell me so I can correct my database.
>
> See http://catb.org/~esr/doclifter/bugs.html for details on how and
> why these patches were generated.  Feel free to email me with any
> questions.  Note: These patches do not change the modification date of
> any manual page.  You may wish to do that by hand.
>
> I apologize if this message seems spammy or impersonal. The volume of
> markup bugs I am tracking is over five hundred - there is no real
> alternative to generating bugmail from a database and template.
>
> --
>                               Eric S. Raymond
>
>
>
> Problems with lvm.8:
>
> List syntax error. This means .IP, .TP or .RS/.RE markup is garbled.
> Common causes include .TP just before a section header, .TP entries
> with tags but no bodies, and mandoc lists with no trailing .El.
> These confuse doclifter, and may also mess up stricter man-page
> browsers like Xman and Rosetta.
>
> --- lvm.8-unpatched	2016-03-03 08:26:12.286823811 -0500
> +++ lvm.8	2016-03-03 08:26:24.274791810 -0500
> @@ -42,122 +42,121 @@
>   .SH BUILT-IN COMMANDS
>   The following commands are built into lvm without links normally
>   being created in the filesystem for them.
> -.TP
> +.IP
>   \fBconfig\fP \(em The same as \fBlvmconfig\fP(8) below.
> -.TP
> +.IP

Hi

Unfortunately patches like this cannot be easily applied.

As the visual rendering here is more important then List syntax error.

So we would need to know some other way to get similar output while
not hitting syntax errors.

Regards

Zdenek
