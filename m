Message-ID: <3D790636.5010603@lingbrae.com>
From: Dick Middleton <dick@lingbrae.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to upgrade old LVM version.
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
Date: Fri Sep  6 14:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux LVM <linux-lvm@sistina.com>

Hi,

    I'm currently running LVM 0.9.1_beta6 on Debian 2.2 with kernel 
2.2.19 and have been trying
for some time to upgrade to something more recent.

Whenever I try this I find that vgscan from any newer version of LVM 
hangs (without
error messages) - I'm forced to reboot.  The only evidence I can find is 
if I run pvscan.  
This reports "different structure size".

I currently have all my filesystem including root running on LVM on top 
of software RAID so
it's a fairly delicate business mucking about with this.  I'm looking 
for  a way to fix the problem
other than decanting everything to tape and starting from scratch again.

I do have a separate bootable disc with 2.4 kernel and LVM 1.0 which I 
can use as a stepping
stone but so far this too hangs as soon as vgscan is run.

Any advice would be appreciated.

Dick
