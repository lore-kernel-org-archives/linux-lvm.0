Message-ID: <3DE3F6BC.1060500@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM for a Database
References: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
In-Reply-To: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
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
Date: Tue Nov 26 16:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

What type of database?

Joseph Kezar wrote:

> We are in the process of building a database on a 4 processor 1.8GHz, 
> 4GB RAM Dell 6650.
>  
> I am trying to figure out the most efficient way to use LVM for our 
> raw data storage.  We have a RAID array with 8x36GB drives in 
> it.  Should I do a raid 1+0(mirror 4 disks, and span them to get one 
> logical volume)?
>  

 I've never worked with an Oracle DBA that would favor this.  "Spindles, 
spindles, spindles" they cry.  Now, I realize that you're going to have 
8 spindles no matter what. 

> If so this leaves me a /dev/sdb.  Or would I get better performance if 
> I mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].

If you have to do RAID for everything, then this would probably be most 
favored (easiest to optimize), but I know several DBAs that would prefer 
to use 8 independent disks, along with a good backup plan and "Oracle 
journal logs" for recovery.  Of course, I'd probably do the RAID thing 
because I'm not a DBA :)

David Corbin
