Message-ID: <3C0D2563.6B627C73@phor.com>
From: Darin Perusich <Darin.Perusich@cognigencorp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] amanda and lvm
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
Date: Tue Dec  4 13:39:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hello,

is anyone using amanda, www.amanda.org to dump lvm's out there? i'm
trying to dump a volume and when it gets to the volume it just hangs
there. the filesystems are reiserfs so i'm using tar to preform the
dumps. i'm able to successfully dump the other filesystems.

i've been using amanda to dump volumes created with Sun's Solstice Disk
Suite. all you need to do is specify the path to the block device, in
this case i'm using /dev/volume_group/logical_volume. the only
difference is under solaris you can use ufsdump.

thanks

-- 
Darin Perusich
Unix Systems Administrator
Cognigen Corp.
darinper@cognigencorp.com
