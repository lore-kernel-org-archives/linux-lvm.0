Message-Id: <20020815084944kaoru@rifu.bsd.tnes.nec.co.jp>
Mime-Version: 1.0
From: kaoru@bsd.tnes.nec.co.jp
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] /proc/partition problem
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
Date: Wed Aug 14 18:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I reffered to /proc/partitions, a strange character code went 
into a name sequence when I created 26 or more volume of LV(s) 
on 2.4.19 with LVM-1.0.5. 

$ cat /proc/partitions
major minor  #blocks  name

  58     0    3145728 lvma
  58     1    3145728 lvmb
  58     2     512000 lvmc
  58     3     204800 lvmd
.........
  58    24      53248 lvmy
  58    25      53248 lvmz
  58    26      53248 lvm{
  58    27      53248 lvm|
  58    28      53248 lvm}
  58    29      53248 lvm~
  58    30      53248 lvm
  58    31      53248 lvm
  58    32      53248 lvm
  58    33      53248 lvm
  58    34      53248 lvm

I think that this problem is depended on illegal codes of 
a disk_name function(fs/partitions/check.c). 

According to fs/partitions/check.c:

char *disk_name (struct gendisk *hd, int minor, char *buf)
{
.................

        if (part)
                sprintf(buf, "%s%c%d", maj, unit+'a', part);
        else
                sprintf(buf, "%s%c", maj, unit+'a');
        return buf;

}

I think it is better that the LVM staff discuss the fault of 
this code with Linux Kernel code maintainer.

--------
Kaoru
