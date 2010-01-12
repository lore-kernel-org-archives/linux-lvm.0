Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0C1E1J6000526
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 20:14:01 -0500
Received: from mail-ew0-f215.google.com (mail-ew0-f215.google.com
	[209.85.219.215])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0C1DihM016602
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 20:13:45 -0500
Received: by ewy7 with SMTP id 7so7321270ewy.30
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 17:13:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B4B4C90.3030407@klunky.co.uk>
References: <4B3B28E5.5030208@tele2.com>
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com> 
	<1262609658.18517.3.camel@localhost>
	<29ae894c1001040517sa6bb7f9v56915a22a820d2c4@mail.gmail.com> 
	<4B4319D1.2020301@tele2.com> <4B4321A4.1030005@tele2.com> 
	<4B4364F5.40209@tele2.com> <4B4B31DC.6030900@tele2.com>
	<f4f537b51001110718u598c1385v28c2143d2705be7d@mail.gmail.com> 
	<4B4B4C90.3030407@klunky.co.uk>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Mon, 11 Jan 2010 19:13:24 -0600
Message-ID: <f4f537b51001111713ufeeeaf7q7875ee7ac75ed65c@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jan 11, 2010 at 10:06 AM, Simon Loewenthal/NL/Tele2
<simon.loewenthal@klunky.co.uk> wrote:
> I don't see the connection with multipath and the lvm.conf? =EF=BF=BDMult=
ipath
> is running well.

<quote>
How do I really know LVM is really using the mutlipath other than
disabling one of the ports on the switch, which I don't wish to do on a
production box.
</quote>

multipath -ll will show you your multipath topology.  you can then see
if the top-level multipath device matches the pvs that are in use
(such as pvdisplay -v).

For "testing" multipathing, which you say is running well, look into
dmsetup with which you can alter the topology and remove paths.
