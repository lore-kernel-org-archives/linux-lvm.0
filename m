MIME-Version: 1.0
In-Reply-To: <20180305165926.GA20527@redhat.com>
References: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
	<20180305165926.GA20527@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 7 Mar 2018 13:50:24 +0800
Message-ID: <CABZYMH5UEDWhO30KiZ1xVe1z+S0pA4DR_yJ8TQ1sCYK48+0d9g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="94eb2c070628b2bb6a0566cc22e2"
Subject: Re: [linux-lvm] [lvmlockd] Refresh lvmlockd leases after sanlock
	changes
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

--94eb2c070628b2bb6a0566cc22e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thank you for your reply!

>
thin lv's from the same thin pool cannot be used from different hosts
> concurrently.  It's not because of lvm metadata, it's because of the way
> dm-thin manages blocks that are shared between thin lvs.  This block
> sharing/unsharing occurs as each read/write happens on the block device,
> not on LV activation or any lvm command.
>

My plan is one vm has one thin lv as root volume, and each thin lv get its
own
thin lv pool, Is this a way to avoid the problem of block share within thin
lv pool?

I suggest trying https://ovirt.org


I did some research on ovirt, there are two designs now
(https://github.com/oVirt/vdsm/blob/master/doc/thin-provisioning.md)
and I found it really relies on SPM host, once SPM host fails, all vms'
availability
will be influenced, which is we don't want to see.


> You need to release the lock on the source host after the vm is suspended=
,
> and acquire the lock on the destination host before the vm is resumed.
> There are hooks in libvirt to do this.  The LV shouldn't be active on bot=
h
> hosts at once.
>

 I did some experiments on this since I have read the libvirt migrate hook
page
(https://libvirt.org/hooks.html#qemu_migration) and it seems useless.
I wrote a simple script and confirm that the hook execute process is:

   1. on dest host, do "migrate begin", "prepare begin", "start begin",
   "started begin"
   2. after a while (usually a few seconds), on source host, do "stopped
   end" and
   "release end"

In a word, it not provide a way to do some thing on the time of vm suspend
and resume.=F0=9F=99=81

Thanks!

Damon

--94eb2c070628b2bb6a0566cc22e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Dave,<br><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Thank you for your reply!<br><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"></blockquote><br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">thin lv&#39;s from the same thin pool cannot b=
e used from different hosts<br>
concurrently.=C2=A0 It&#39;s not because of lvm metadata, it&#39;s because =
of the way<br>
dm-thin manages blocks that are shared between thin lvs.=C2=A0 This block<b=
r>
sharing/unsharing occurs as each read/write happens on the block device,<br=
>
not on LV activation or any lvm command.<br></blockquote><div><br></div><di=
v>My plan is one vm has one thin lv as root volume, and each thin lv get it=
s own</div><div>thin lv pool, Is this a way to avoid the problem of block s=
hare within thin lv pool?</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I suggest trying <a href=3D"https://ovirt.org" rel=3D"=
noreferrer" target=3D"_blank">https://ovirt.org</a></blockquote><div><br></=
div><div>I did some research on ovirt, there are two designs now</div><div>=
(<a href=3D"https://github.com/oVirt/vdsm/blob/master/doc/thin-provisioning=
.md">https://github.com/oVirt/vdsm/blob/master/doc/thin-provisioning.md</a>=
)</div><div>and I found it really relies on SPM host, once SPM host fails, =
all vms&#39;=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">availability</span></div><div> =
will be influenced, which is we don&#39;t want to see.=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
You need to release the lock on the source host after the vm is suspended,<=
br>
and acquire the lock on the destination host before the vm is resumed.<br>
There are hooks in libvirt to do this.=C2=A0 The LV shouldn&#39;t be active=
 on both<br>
hosts at once.<br></blockquote><div><br></div><div>=C2=A0I did some experim=
ents on this since I have read the libvirt migrate hook page=C2=A0</div><di=
v>(<a href=3D"https://libvirt.org/hooks.html#qemu_migration">https://libvir=
t.org/hooks.html#qemu_migration</a>) and it seems useless.</div><div>I wrot=
e a simple script and confirm that the hook execute process is:</div><div><=
ol><li>on dest host, do &quot;migrate begin&quot;, &quot;prepare begin&quot=
;, &quot;start begin&quot;, &quot;started begin&quot;</li><li>after a while=
 (usually a few seconds), on source host, do &quot;stopped end&quot; and <b=
r>&quot;release end&quot;</li></ol><div>In a word, it not provide a way to =
do some thing on the time of vm suspend and resume.=F0=9F=99=81</div></div>=
</div><br></div><div class=3D"gmail_extra">Thanks!</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Damon</div></div>

--94eb2c070628b2bb6a0566cc22e2--
