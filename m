From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] recreate metadata of an PV possible if vda-backup present?
Message-ID: <20040122161830.GA1719@tykepenguin.com>
References: <108049294.20040121235827@gmx.de> <20040122140727.GA992@tykepenguin.com> <9769820736.20040122170759@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9769820736.20040122170759@gmx.de>
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
Date: Thu Jan 22 11:20:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 22, 2004 at 05:07:59PM +0100, Malte Woelky wrote:
> Hallo,
> 
> Thursday, January 22, 2004, 3:07:27 PM, you wrote:
> 
> 
> >> 
> >> I would be very, very happy if someone could post some hints to try...
> >> 
> 
> PC> # pvcreate /dev/hdc
> PC> # vgcfgrestore -n vg01 /dev/hdc
> PC> # vgscan
> 
> PC> should restore the VG for you.
> 
> Thanks - I thought pvcreate would destroy the data, but it seem only
> to initialize the PV without overwriting data, right?

Yes, pvcreate only overwrites the PV metadata area of the disk. Any actual data
is left intact (assuming it wasn't erased by something else!)
 
> 
> It's pity that I can't check this out, because I already recreated a
> new LV this morning because of time preasure ;-( Too bad for me...

Ah well, keep this email for next time :^)

-- 

patrick
