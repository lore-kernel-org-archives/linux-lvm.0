From: Chris Harwell <charwell@digitalpulp.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.1-rc1 available at
    www.sistina.com
In-Reply-To: <20020315205256.GA743@antimony.sistina.com>
Message-Id: <Pine.LNX.4.44.0203191159380.3608-100000@clapper.digitalpulp.com>
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
Date: Tue Mar 19 11:06:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 15 Mar 2002, AJ Lewis wrote:
> LVM 1.1-rc1 release candidate supports both version 1 and 2 of the metadata.



thanks! this does fix the pvmove 2GB limit problem i ran into. 

just a note, it seemed as if the --test feature had changed between the
two pvmove versions. that is, before with 1.0.3 i was able to run multiple
pvmove --test multiple times and it continued to work.  now with 1.1rc1 i
had to run a vgscan in order to run pvmove --test again because i got this
error on the second invocation:

pvmove --test /dev/hda14
pvmove -- no logical volumes on empty source physical volume "/dev/hda14"

worked just fine after that vgscan though :>

i'm not sure if i just needed to run vgscan since i was using a new 
version of the lvm tools anyway or if that --test does actually change 
something (like the info in /etc/lvm....?).

at any rate, lvm is great and continues to power our mp3 player
wonderfully - thanks LVM :>

-- 
chris
charwell@digitalpulp.com
