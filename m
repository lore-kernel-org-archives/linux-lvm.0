Message-Id: <200201211231.g0LCVs323967@in-cadcae4.ing.temic.de>
From: Emanuel Quass <emanuel.quass@temic.com>
Subject: Re: [linux-lvm] ERROR "parameter error" setting up snapshot copy
    on write exception table
References: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
    <200201211146.g0LBkui23525@in-cadcae4.ing.temic.de>
    <21530000.1011615003@methusalix>
In-Reply-To: <21530000.1011615003@methusalix>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan 21 06:32:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Marc Grimme <grimme@atix.de>, linux-lvm@sistina.com

Hi again,


Am Montag, 21. Januar 2002 13:10 schrieb Marc Grimme:
> Hi
>
> --On Montag, Januar 21, 2002 12:46:56 +0100 Emanuel Quass
>
> <emanuel.quass@temic.com> wrote:
> > Hi
> >
> > I rebooted the server several times (and tried several kernel-versions)
> > but  every time I got the same error!
> > The problem is (afaik see) the snapshot. I think if I can get rid of the
> > snapshot everything will work all right. But I am not able to remove the
> > snapshot because the Volumegroup is not active ......
>
> I had exactly the same problem and the same thoughts but I really don't
> know how to delete a snapshot of an inactive volumegroup and I couldn't
> find any program that was provided and did the job. Perhaps you can recover
> some old configurations without snapshot with vgcfgrestore and stuff. But
> I'm not really sure if this works cause the problem went away after I
> rebooted the machine and was never to be seen again. And I was happy and
> didn't touch this system again.

I already tried to do so, no result! :-(
vgcfgrestore didn't helpo me out.

>
> And if vgcfgrestore helps, what if you create a snapshot and then some
> other vgs and lvs and then your snapshot gets corrupt like this, can
> vgcfgrestore help here also?
>
> So I would say I'm out. :-(
>
> > Is there a way to remove the snapshot (the volumegroup can't be made
> > active)  without touching the other logical volumes ?
>
> Would be really interesting to know the answer.
>
