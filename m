Subject: Re: [linux-lvm] extending a logical volume
In-Reply-To: Your message of
    "Tue, 22 Jan 2002 12:03:18 MST."
    <20020122120317.Z4014@lynx.turbolabs.com>
References: <E16Syml-0004V1-00@arwen.dev33.cvf>
    <Pine.LNX.4.10.10201221211580.24040-100000@pzat.meep.org>
    <20020122120317.Z4014@lynx.turbolabs.com>
MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16TP0T-0001zV-00@arwen.dev33.cvf>
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
Date: Wed Jan 23 09:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

To conclude on this subject, here is what I've done.
I've extended my ext3 partition offline and not online.
These commands are easy but maybe they will help some persons. They would have 
helped me ...


lvextend -L+200 /dev/testlvm/testlv
lvscan
umount /dev/testlvm/testlv 

e2fsck -f /dev/testlvm/testlv 
resize2fs -d -p /dev/testlvm/testlv
mount /dev/testlvm/testlv /mnt/lvm  
df -k


Hope this will help some user, if it's not the case sorry to put a so newbie 
post.


Regards.




-- 
Pierrick PONS
CVF Bordeaux
mail: ppons@cvf.fr
