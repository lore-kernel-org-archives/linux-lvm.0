Message-ID: <XFMail.20020906135021.f.hinzmann@hamburg.de>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <20020904145914.A27187@sistina.com>
From: Florian Hinzmann <f.hinzmann@hamburg.de>
Subject: Re: [linux-lvm] Error after moving volume group to another machi
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
Date: Fri Sep  6 06:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello Heinz!


On 04-Sep-2002 Heinz J . Mauelshagen wrote:

> is it really 3 HDDs you want to move, not 4?
> It says "Cur PV               4" in the pvdata output below.
> Maybe that still makes sense, because you have 2 PVs in 2 partitions on
> the very same physical disk.

No, I was really moving 4 out of that box. I just got confused writing
my mail as there were 3 other disks involved and I was shuffling
them around and using some of them temporarily to reach the setup
I wanted. But I am off topic here .. ;)

It has not been a LVM nor a software problem. One of the power 
connectors was broken, so one disk did not have power. Maybe it 
is possible to have a more expressive error message?

Something like "VG <name> consists of 4 PVs, only finding 3".


Anyway, it was my fault, thanks for your thoughts about it!


  Regards
       Florian


--
  Florian Hinzmann                         private: f.hinzmann@hamburg.de
                                            Debian: fh@debian.org
PGP Key / ID: 1024D/B4071A65
Fingerprint : F9AB 00C1 3E3A 8125 DD3F  DF1C DF79 A374 B407 1A65
