From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Importing Problems
In-Reply-To: <009701c1a4e9$57c83b80$9b09360a@ar.attla.corp>
Message-Id: <Pine.LNX.4.10.10201241603420.7293-100000@pzat.meep.org>
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
Date: Thu Jan 24 10:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Thu, 24 Jan 2002, Emiliano Ariel Lesende wrote:

> ------------------------- TERMINAL -----------------------------------------------------
> 
> Look at the vgextend command... it says that my volume is not active, but when I do a vgchange -ay I tells me that it is already activated. Other thing I don't
> understand is why my physical volumes are all inactive the the system is mounted?
> 
> Did I do something wrong? Can I correct this?
> 
> Any help is appreciated, thanks in advance.
> Emiliano Lesende
> 

Did you add disk from a machine with a volume group already called system?

You should have done a vgexport first if you did, if you don;t you get two
possible problems a name clash, Active groups have a number starting with
the first oen you created and that can clash too... Don't look like that
in your case, in both cases you can avoid it with vgexport/vgimport

You could ty renaming your volume group, that should allow the shadow
"system" group to show, 

vgrename /dev/system /dev/system2

then do a vgmerge of system and system2 into system 

James
