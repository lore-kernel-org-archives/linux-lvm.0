Return-Path: <root@srv.sistina.com>
Date: Mon, 23 Apr 2001 12:05:21 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What have snapshots got to do with LVM ?
Message-ID: <20010423120521.A27695@sistina.com>
References: <20010422130924.A10390@66bassett.freeserve.co.uk> <20010423102145.C27367@sistina.com> <20010423093818.B739@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010423093818.B739@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Mon, Apr 23, 2001 at 09:38:18AM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 23, 2001 at 09:38:18AM +0100, Joe Thornber wrote:
> On Mon, Apr 23, 2001 at 10:21:45AM +0000, Heinz J. Mauelshagen wrote:
> > On Sun, Apr 22, 2001 at 01:09:24PM +0100, Joe Thornber wrote:
> > > Just a random Sunday morning thought:
> > > 
> > > Why don't we split snapshots off into their own driver so we can
> > > snapshot any block device, putting the COW tables on any other block
> > > device ?  
> > 
> > Any other block device devides into PE similar allocation units carrying their
> > own COW exception table at the beginning?
> 
> I'm not sure I understand your comment.  There are two devices the
> snapshot origin and the snapshot storage device.  We can divide the
> snapshot storage device up how we want, the COW exception tables go in
> here.

With LVM sanpshots we devide a device into PEs, allocate parts of the
COW table dealing with exceptions stored in a specific PE at the very
beginning of the PE.

My point is, that a similar allocation policy needs to take place on a
general block device too in order to avoid disk access overhead.


> 
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
