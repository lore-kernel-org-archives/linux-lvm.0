From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] trying to restore data after Harddisk breakdown
Message-ID: <20030427152621.A13215@uk.sistina.com>
References: <3EABA9DC.2050507@stella.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EABA9DC.2050507@stella.at>; from kai@stella.at on Sun, Apr 27, 2003 at 11:58:52AM +0200
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
Date: Sun Apr 27 09:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Apr 27, 2003 at 11:58:52AM +0200, Kai Iskratsch wrote:
> Im Using now kernel 2.4.20 and device-mapper + lvm checked out from cvs 
> yesterday night.
> (Compilation was not that easy,  i had to make some changes for 
> device-mapper

It's normally safer to use a packaged release (or checkout against a
label corresponding to a release): it's dangerous to assume what's at
the head of CVS at any instant is going to work properly.


>         pv0 {
>             device = "/dev/hdg1"    # Hint only
> 
>             pe_count = 29310    # 114.492 Gigabytes
 
>         pv1 {
>             device = "/dev/hdf1"    # Hint only
>             pe_count = 19078    # 74.5234 Gigabytes
 
>     logical_volumes {
>         MP3 {
>                     "pv0", 0
 
>         DATA {
>                     "pv0", 15360
 
>         VIDEO {
>             segment1 {
>                     "pv0", 20480
>             segment2 {
>                     "Missing", 0

> -----------------------------------------------
> first this says that the 120GB disk is my PV0 and the 80 GB is my PV1, 
> second it says that my 2 working LVs are entirely on the 120 GB 
Yes, that's what the metadata says.

And VIDEO was split between all three disks.

> and I only need to add the new PV and  replace all the Missing 
> Segments by one on the new PV?

If you want to try to salvage something from VIDEO, yes.

Otherwise if you just want to remove VIDEO, use vgreduce --removemissing (but
read the man page first: run with --test to check it's going to do what
you want it to).
 
Alasdair
-- 
agk@uk.sistina.com
