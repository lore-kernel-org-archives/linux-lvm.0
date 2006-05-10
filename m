Date: Wed, 10 May 2006 21:40:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [BUG] Spaces in LVM1 LV names => *deep trouble* when
	converting to LVM2
Message-ID: <20060510204038.GX16180@agk.surrey.redhat.com>
References: <44624C66.4050600@idealx.com>
	<20060510203626.GW16180@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060510203626.GW16180@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>, pierre.machard@idealx.com, Benoit Picaud <benoit@idealx.com>, 'Mathias BROSSARD' <mbrossard@idealx.com>

On Wed, May 10, 2006 at 09:36:26PM +0100, Alasdair G Kergon wrote:
> On Wed, May 10, 2006 at 10:26:14PM +0200, Dominique Quatravaux wrote:
> >     * there should be a mechanism for dealing with corrupt LVM
> >       metadata, at the minimum a global command-line switch to
> >       temporarily disable checksum verifications.
> 
> Nope.
  
I should add that what you should do is extract the metadata you've
retrieved off disk directly into a file, fix it in the file
(differences in whitespace & comments don't matter) then use 
vgcfgrestore -f.

Alasdair
-- 
agk@redhat.com
