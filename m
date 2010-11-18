Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAIKpUqV014010
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:51:30 -0500
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAIKpEv3018737
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:51:15 -0500
Received: by fxm13 with SMTP id 13so25611fxm.33
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 12:51:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CE53C8C.7010109@redhat.com>
References: <714075.64821.qm@web37902.mail.mud.yahoo.com>
	<4CE53C8C.7010109@redhat.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Thu, 18 Nov 2010 14:50:54 -0600
Message-ID: <AANLkTimskCLYS4c-m+BaPWNWLNfQzLo19XkOn35LkhmB@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] volume group does not activate after reboot
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

On Thu, Nov 18, 2010 at 8:47 AM, Dave Sullivan <dsulliva@redhat.com> wrote:
> Add that vchange -ay to /etc/rc.local
>
> Are you mounting with _netdev option in /etc/fstab?
>
> That sounds like the problem to me. Try the _netdev option first. =EF=BF=
=BDNeeded
> for IP mounted storage (i.e. ISCSI)

we add a mount -a after the vgchange -ay :)  _netdev alone wasn't
doing it as iscsi starts up after lvm...i think...
