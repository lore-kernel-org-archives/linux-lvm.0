From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Max storage size per system
Message-ID: <20030306162150.GA11451@gw.silicide.dk>
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de> <4857903125.20030305160532@tnonline.net> <20030305194551.GA11043@hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030305194551.GA11043@hcsd.de>
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
Date: Thu Mar  6 10:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 05, 2003 at 08:45:51PM +0100, Stephan Austermuehle wrote:
> On Wed, Mar 05, 2003 at 04:05:32PM +0100, Anders Widman wrote:
> 
> > Hm,  sounds  like  lots.  :)  What kind of devices will you be running
> > with.  Even  with  300GB  drives  you will need 300-400 of them to get
> > 100TB.
> 
> A single HP XP 1024 (which is an OEM product of a HDS Lightning) stores
> 130 TB with a 7p1 RAID5 configuration and 146 GB disks.

hmm, that would need 130T/0.146T = 890 disks. And running raid 5...
personaly i dont like raid5, because if you loose more than one
disk your data are gone, and with this ammount of disks, i expect
failure rather often. (it's proberly not one big raid5 array,
but that just makes it need more disks).



JonB
