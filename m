Message-ID: <3F55B6E2.1070202@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM1 and a dying disk
References: <3F55ABF8.40608@webhackande.se> <20030903111442.C2618@sistina.com>
In-Reply-To: <20030903111442.C2618@sistina.com>
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
Date: Wed Sep  3 04:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:

> you say that you don't have a recent LVM metadata backup reflecting
> your VG with /dev/ide/host0/bus1/target0/lun0/disc in it ?

Well, possibly. Many of the files could be rescued off the damaged root 
file system, even if the directory structure was shot. What file(s) 
would I be looking for? There's 18487 numbered directories in lost+found 
with a large number of subdirectories - but if I have a name to go on, I 
may be able to find something useful in there.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
