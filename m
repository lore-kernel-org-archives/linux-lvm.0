Message-ID: <3F9D327C.6020102@elitedvb.net>
From: Felix Domke <tmbinc@elitedvb.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64
 kernel
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com> <3F9C0AC9.6050805@elitedvb.net> <20031027120104.K848@sistina.com>
In-Reply-To: <20031027120104.K848@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Oct 27 08:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

>User space parses and passes it via ioctls to the kernel.
>Please look at lvm.h for the ioctls defined and the structures involved.
>Grep the LVM1 library source in tools/lib/ for "ioctl" to get you started.
>  
>
Where exactly is the LV information passed to the kernel? is it 
"LV_CREATE"?

The kernel seems to don't know the LV, the LV_STATUS_BYINDEX on the 
"/dev/fast/group" returns "No such device or address" (ENXIO) for each 
index, including 0, which should be the LV in question.

It looks as "lvm_do_lv_status_byindex" in the kernel returns -ENXIO 
because vg_ptr->lv[lv_status_byindex_req.lv_index] is zero. Where is the 
point where this array is written? I only found LV_CREATE, but that's 
only called in vgimport, vgmerge and lvcreate, so it looks as there is 
another place.


Can you point me in the direction?


Felix
