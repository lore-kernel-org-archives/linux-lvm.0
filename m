From: vegh@omega.telia.net
Message-ID: <Pine.LNX.4.44.0304051859320.7718-100000@omega.telia.net>
MIME-Version: 1.0
Subject: [linux-lvm] Strange hard drive behaviour
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
Date: Sat Apr  5 10:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I have a question regarding strange hard drive behaviour with an LVM 
volume. When I am creating the ext2 file system over my volume, the 
process takes much more time than expected, and the hard drive makes a strange noise, it 
sounds like its head is jumping back and forth all the time. I have the same noise 
when for example I make 'du' on the volume, or copy large amount of data. 
I dont have that harsh noise on other file systems. Otherwise everything seems to work fine.

My configuration:
I have two RAID arrays with hardware RAID controllers, so it is transparent
to the kernel. I create a PV from the last partition of the first array,
and an other PV with the whole second array. I add them to a VG with 32 M 
extent size, and create one logical volume of the whole VG. I dont use any 
stripping. I use the default parameters with mkfs too.

Thanks
