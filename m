Subject: Re: [linux-lvm] Howto Make LVM Work With NBD/ENBD?
Message-Id: <1020086556.3ccd491c5efd7@mail.holanyi.hu>
From: "Csan (Ja'nos Hola'nyi)" <csani@lme.linux.hu>
References: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
In-Reply-To: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Mon Apr 29 08:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi Ning,

I had similar problems with exactly the same ERROR message.
I figure this is lvm10...?
In that case, please check if _noprocdir[] and _devdir[] sections in
LVM/1.0.3/tools/lib/lvm_dir_cache.c contain the line:

        LVM_DIR_PREFIX "nb",

If not, insert, make (in LVM/1.0.3/), make install and it should work.

If you're on Debian, you could also check out the APT archives at

deb http://people.debian.org/~patrick unstable main

and install lvm10 from there (they're OK also for Debian 3.0 woody). That
package already contains these fixes.

(BTW, I am actually building a HA cluster with DRBD+LVM. DRBD uses nbd.
Currently there are some issues on the standby node - LV detection not working
yet -, but we're slowly getting there. The active node has ext3fs on the LV, and
the replication works great... so far.)

Best regards,

Csan

PS: thanks for the above fixes go to "ejt" and "pjc" guys on #lvm
(irc.openprojects.net)
Please CC: me if you're replying as I am not subscribed to the list.

Quoting Ning Ye <nye@csee.wvu.edu>:

> Hi!,
> 
>     I want to make them work together, which makes me crazy these days. 
> 
> 
>     I can initialize the disks and partitions exported by ENBD, but when
> trying to create a volume group on it, vgcreate fails.
> # vgcreate my_volume /dev/ndb
> vgcreate -- ERROR "pv_read(): read" reading physical volumes
>     After examine the debug output, it looks to me lvm trying to
> enumerate all physical disks present to the system.  These disks include
> SCSI disks(sda...), IDE disks(hda...) and loops(loop0...).  However, the
> LVM will not recognize the exported disk as a physical one.
> 
>     Did any one ever make it work before?  I would like to know before I
> am trying to look into the code.  Combining these two great packages
> would be wonderful.  But how?  Help needed.  Thanks.
> 
>                 Ning
> 
> 



Csan

J�nos Hol�nyi
Association of Hungarian Linux Users
Email: csani@lme.linux.hu
