Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3RMJSeA010061
	for <linux-lvm@redhat.com>; Thu, 27 Apr 2006 18:19:28 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <000601c66984$779e7230$640a0a0a@laptopoptimus>
References: <000601c66984$779e7230$640a0a0a@laptopoptimus>
Content-Type: multipart/alternative; boundary=Apple-Mail-2-365562039
Message-Id: <96158ca02019bf92bbc5dea70d9edef9@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Cloning Logical Volumes
Date: Thu, 27 Apr 2006 17:21:26 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-2-365562039
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=WINDOWS-1252;
	format=flowed

dd is probably the best way right now.

in the future, the clone would probably take the form:
prompt> lvconvert -m1 vg/lv; (wait for sync); lvsplit vg/lv

The syntax isn't worked out yet and lvsplit is not there yet... but we=20=

have talked about doing something like that.

  brassow


On Apr 26, 2006, at 5:55 PM, Greg Hartzog wrote:

> Hello there folks.=A0 I have a question.
> =A0
> I am looking for a better way of cloning logical volumes then creating=20=

> a new logical volume, identical to a source logical volume, and using=20=

> =93dd=94 to copy data between the two logical volumes.
> =A0
> I would love to use dm-mirror to do this, but I do not think any=20
> interface has been provided to do this yet.
> =A0
> All suggestions and ideas appreciated.
> =A0
> I am running lvm2-2.02.04-r1 & 2.6.15 kernel.
> =A0
> Thanks!
> =A0
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=

--Apple-Mail-2-365562039
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=WINDOWS-1252

dd is probably the best way right now.


in the future, the clone would probably take the form:

prompt> lvconvert -m1 vg/lv; (wait for sync); lvsplit vg/lv


The syntax isn't worked out yet and lvsplit is not there yet... but we
have talked about doing something like that.


 brassow



On Apr 26, 2006, at 5:55 PM, Greg Hartzog wrote:


<excerpt><fontfamily><param>Arial</param><bigger><bigger>Hello there
folks.=A0 I have a question.</bigger></bigger></fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

<fontfamily><param>Arial</param><bigger><bigger>I am looking for a
better way of cloning logical volumes then creating a new logical
volume, identical to a source logical volume, and using =93dd=94 to copy
data between the two logical volumes.</bigger></bigger></fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

<fontfamily><param>Arial</param><bigger><bigger>I would love to use
dm-mirror to do this, but I do not think any interface has been
provided to do this yet.</bigger></bigger></fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

<fontfamily><param>Arial</param><bigger><bigger>All suggestions and
ideas appreciated.</bigger></bigger></fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

<fontfamily><param>Arial</param><bigger><bigger>I am running
lvm2-2.02.04-r1 & 2.6.15 kernel.</bigger></bigger></fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>Thanks!</bigger></bigger><=
/fontfamily>

=
<fontfamily><param>Arial</param><bigger><bigger>=A0</bigger></bigger></fon=
tfamily>

_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>=

--Apple-Mail-2-365562039--
