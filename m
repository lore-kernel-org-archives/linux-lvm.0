Message-ID: <3FA639A7.1090100@c3systems.com.br>
From: Claudio Cuqui <claudio@c3systems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using RAID-0 disks to snapshot backups
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
Date: Mon Nov  3 07:44:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Guys,

Anybody have any idea about what could happen if, during a snapshot the 
discs used by the snapshot logical volume fail ? What I expect is that 
my snapshot will fail (nothing could be more fair than this ;-) , but is 
there any chance of this corrupt the logical volume that was being 
backuped during the disc failure ?

TIA,

Cuqui
