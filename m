Subject: Re: [linux-lvm] LVs with the same LV#.
References: <wxxadsj4vo6.fsf@nommo.uio.no>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <wxxadsj4vo6.fsf@nommo.uio.no>
Message-Id: <wxx662cq2d8.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Sat Apr 27 16:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Terje Kvernes <terjekv@math.uio.no> writes:

>   a 'vgdisplay -v' ends with the following:
> 
> --- Logical volume ---
> LV Name                /dev/cornucopia/gjester-u1
> VG Name                cornucopia
> LV Write Access        read/write
> LV Status              available
> LV #                   7
> # open                 0
> LV Size                2.00 GB
> Current LE             32
> Allocated LE           32
> Allocation             next free
> Read ahead sectors     10000
> Block device           58:6
> 
> --- Logical volume ---
> LV Name                /dev/cornucopia/ansatte-u1
> VG Name                cornucopia
> LV Write Access        read/write
> LV Status              available
> LV #                   7
> # open                 0
> LV Size                2.00 GB
> Current LE             256
> Allocated LE           256
> Allocation             next free
> Read ahead sectors     10000
> Block device           58:6

  for the record, when we finally booted the box everything was fine,
  both LV's where gone.  umount and a couple of vgchanges probably
  would have solved the issue.  :)

-- 
Terje
