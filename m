Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBRKlq2l028847
	for <linux-lvm@redhat.com>; Wed, 27 Dec 2006 15:47:52 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.236])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBRKlp6L030785
	for <linux-lvm@redhat.com>; Wed, 27 Dec 2006 15:47:51 -0500
Received: by wx-out-0506.google.com with SMTP id s11so5377331wxc
	for <linux-lvm@redhat.com>; Wed, 27 Dec 2006 12:47:51 -0800 (PST)
Message-ID: <859a78260612271247m7b14c247n7f420c7ebea5b906@mail.gmail.com>
Date: Wed, 27 Dec 2006 14:47:51 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Mirror between different SAN fabrics
In-Reply-To: <4339128.1167221745260.JavaMail.mailer@post.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <859a78260612220751n3f0570abgdf4e865fabeb90d5@mail.gmail.com>
	<4339128.1167221745260.JavaMail.mailer@post.ch>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I guess I should have tested the functionality out before I made the
comment. It seems the ability to add a mirror after the fact is still
not available (in lvconvert or otherwise). I'm sure someone will
correct me if I wrong on that.

I did figure out a crazy way you could do it, but it's messy, even
with small number of PVs. It would impact performance and is probably
not feasible in reality.

I think the proper way would be to use mdadm. Setup software RAID1
prior to getting LVM involved...

On 12/27/06, mathias.herzog@postfinance.ch
<mathias.herzog@postfinance.ch> wrote:
>
> > From: linux-lvm-bounces@redhat.com
> > [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Matt P
>
> > I can't think of any Volume Manager that would let you mirror
> > disks from 2 separate VGs...
> Maybe not from 2 separate VGs but they add an additional level to group
> PVs together. With HP-UX you can use "lvcreate -m -s g" to use different
> PV-groups for the mirror. With Tru64 as far as I know you can use a Plex
> to create a PV-group (should be similar with Veritas)
>
> > But other than that I wouldn't see why you couldn't use 2
> > different fabrics, they're just disks to LVM... If you're
> > having trouble managing 200+ PVs, just build the LV first
> > using only disks from 1 fabric, then make the second fabric
> > available/visible, and add a mirror using only those disks...
> > I think that would work...
> That's an idea, but when I'm adding 4 more disks (eg. disk1 and disk2
> from fabric1, disk3 and disk4 from fabric2), how can I tell LVM to
> mirror Disk1,2 to Disk3,4 and not to mirror Disk1 to Disk2?
>
> Regards Mathias
>
> Sicherheitshinweis:
> Dieses E-Mail von PostFinance ist signiert. Weitere Informationen finden Sie unter:
> https://www.postfinance.ch/e-signature.
> Geben Sie Ihre Sicherheitselemente niemals Dritten bekannt.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
