Date: Wed, 28 Jul 1999 11:31:25 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990728113124.A13011@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie> <Pine.LNX.3.96.990726222206.21028A-100000@chiara.csoma.elte.hu> <19990727114737.E8908@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <19990727114737.E8908@colombina.comedia.it>; from Luca Berra on Tue, Jul 27, 1999 at 11:47:37AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Jul 27, 1999 at 11:47:37AM +0200, Luca Berra wrote:
> On Mon, Jul 26, 1999 at 10:25:50PM +0200, Ingo Molnar wrote:
> > > or ideally for raid to be fully integrated into LVM, and create
> > > RAID-5 VG's. 
> > or, considering the relative complexity of the two drivers (and the
> > conceptual background), to integrate LVM into the concepts of RAID :) Or
> i dont understand your last sentence
> > let them live side by side as now.
> 
> i believe useful integrating raid and lvm
> it means a user can dcide the different raid policy
> for each type of data.
Following a recent discussion on linux-raid, it occurs to me
that another reason for integrating raid into lvm would be
ease of adding disks to an existing setup.

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
