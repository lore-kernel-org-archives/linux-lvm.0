Subject: Re: [linux-lvm] read is blocking if reading snapshots with 16k
    blocks on mp systems
Message-Id: <OFEAA786E7.AD8AE8DE-ONC1256B3E.0057581D@de.ibm.com>
From: "Martin Petermann" <martin.petermann@de.ibm.com>
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
Date: Fri Jan 11 12:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


> On Thu, Jan 10, 2002 at 07:58:37PM +0100, Martin Petermann wrote:
> > Hi all,
> >
> > I had some performance problems, than I wrote a small program to see
where
> > it was hanging:
> >
> > -my configuration:
> >
> > I'm using a SuSE 7.1 and SuSE 7.2 mp system (two processors).
> I've created a snapshot in the following way:
>
>
> > The maximum time read was hanging was 40 seconds. I detected similar
> > problems reading 3*4096 bytes.
>
> Can you tell us more about your system - I can't get this to over 3
seconds even
> on a dog slow IDE system with next-to no memory.

Hi Patrick,

this system has the following configuration:

- two pentium III processors (933 MHz), 256 KB cache
- 500 MB RAM
- the physical volumes reside on a hardware RAID (IBM ServRAID, RAID level
5)
- FC connected disks

I'll have to do some more investigations. I first thought multiprocessing
was the cause for this problem. But even in single processor mode(boot:
linux maxcpus=0 noapic) the problem exists. If people find out a problem on
such a configuration it's not easy to find out why.

Regards
   Martin
