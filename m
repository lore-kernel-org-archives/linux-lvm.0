Subject: Re: [linux-lvm] LVM fails at bootup
Message-ID: <20011115081208.B363@btconnect.com>
References: <20011112141948.P715@sonsofthunder.yi.org> <20011112123227.U1778@lynx.no> <3BF323F5.5E90F63B@divsol.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BF323F5.5E90F63B@divsol.com>; from jcromie@divsol.com on Wed, Nov 14, 2001 at 07:09:57PM -0700
From: Joe Thornber <thornber@btconnect.com>
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
Date: Thu Nov 15 02:41:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 14, 2001 at 07:09:57PM -0700, Jim Cromie wrote:
> Andreas Dilger wrote:
> 
> > On Nov 12, 2001  14:19 -0500, Bradley M Alexander wrote:
> > > I added the vgscan and the vgchange commands to the end of the checkroot.sh
> > > script (which in Debian is different from the mountfs.sh script). When the
> > > vgscan runs, it generates about two pages of drive errors:
> > >
> > > hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> > > hdb: read_intr: error=0x04 { DriveStatusError }

I've also seen this error when the kernel mistakenly thought there was
a partition on an IDE disk that I was using as a PV.  The vgscan command
then trys to look at this bogus partition and causes all these errors.

- Joe
