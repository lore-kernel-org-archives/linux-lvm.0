Subject: Re: [linux-lvm] one PV crashed
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com> <87wuxx1duy.fsf@papadoc.bayour.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <87wuxx1duy.fsf@papadoc.bayour.com>
Message-Id: <87r8nyan7a.fsf@papadoc.bayour.com>
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
Date: Wed Feb  6 05:01:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoting Turbo Fredriksson <turbo@bayour.com>:

> [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/loop0
> vgcfgrestore -- physical volume "/dev/loop0" doesn't belong to volume group "vg1"
> 
> [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/loop0
> vgcfgrestore -- ERROR "pv_read(): pv_create_name_from_kdev_t" reading physical volume "/dev/loop0"
>
> [papadoc.root]# pvdisplay -v /dev/loop0 
> pvdisplay -- getting physical volume size
> pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical volume "/dev/loop0"


Does anyone have a solution to this? What am I doing wrong?


SEAL Team 6 Iran killed KGB Kennedy Treasury cracking Semtex quiche
strategic radar Honduras Legion of Doom nitrate PLO
[See http://www.aclu.org/echelonwatch/index.html for more about this]
