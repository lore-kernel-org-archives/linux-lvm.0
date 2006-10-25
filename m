Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9PNItqi013754
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 19:18:55 -0400
Received: from mail.opendreams.net (mail.opendreams.net [69.88.106.142])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9PNIskg007117
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 19:18:54 -0400
Date: Wed, 25 Oct 2006 16:18:47 -0700
From: Jesse Molina <jesse@opendreams.net>
Subject: Re: [linux-lvm] Using lvm1 vg's in lvm2 systems (RHEL4)
Message-ID: <20061025231847.GA17630@sorrows.opendreams.net>
References: <806e72ee0610171500i26f4fa8ek469fa7d02031ae1@mail.gmail.com>
	<20061017223949.GP17654@agk.surrey.redhat.com>
	<806e72ee0610171621p1cb6e9d2r795002ce70293177@mail.gmail.com>
	<806e72ee0610250843k4e340b02s238835ce02626e9f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <806e72ee0610250843k4e340b02s238835ce02626e9f@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Thanks for indicating your solution.  I was having a very similar problem upgrading a Debian Unstable system a few months ago.  I still need to upgrade that system, so this might help me when that time comes around.



On Wed, Oct 25, 2006 at 12:43:56PM -0300, Fabricio Candido wrote:
>    Hi all.
> 
>       I've solved this problem downgrading the lvm version from RHEL4U2 to
>    RHEL4U1 included version.
> 
>    Thanks all.
> 
>    Fabricio
> 
>    On 10/17/06, Fabricio Candido <fabricio.candido@gmail.com> wrote:
> 
>      Alasdair,
> 
>        Thanks for your helping.
> 
>        I got these messages when I just execute vgdisplay, vgscan or pvscan:
> 
>        LV lv_oracle_data012: inconsistent LE count 252 != 1008
>        Internal error: LV segments corrupted in lv_oracle_data012.
>        LV lv_oracle_redo003: inconsistent LE count 4 != 16
>        Internal error: LV segments corrupted in lv_oracle_redo003.
>        LV lv_oracle_data020: inconsistent LE count 252 != 1008
>        Internal error: LV segments corrupted in lv_oracle_data020.
> 
>        I just imported these volumes in another RHEL3 server without
>      problems.
> 
>      Any ideas ?
> 
>      Regards,
>      Fabricio
>      On 10/17/06, Alasdair G Kergon <agk@redhat.com> wrote:
> 
>        On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:
>        > Is it possible to my RHEL4 system use these lvm1 vgs without
>        converting it ?
>        > What is necessary ?
> 
>        Yes, provided you can manage without snapshots and pvmove.
>        [Alternatively, you can run vgconvert to update your metadata in-situ
>        to the
>        new lvm2 format.]
> 
>        Alasdair
>        --
>        agk@redhat.com
> 
>        _______________________________________________
>        linux-lvm mailing list
>        linux-lvm@redhat.com
>        https://www.redhat.com/mailman/listinfo/linux-lvm
>        read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/
 
 
