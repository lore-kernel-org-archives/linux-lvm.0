From: Anders Widman <andewid@tnonline.net>
Message-ID: <2334816437.20021224114543@tnonline.net>
Subject: Re: [linux-lvm] broken computer
In-Reply-To: <33334750984.20021224114437@tnonline.net>
References: <1040726414.3e08398e92f76@webmail.kuleuven.ac.be>
 <33334750984.20021224114437@tnonline.net>
MIME-Version: 1.0
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
Date: Tue Dec 24 04:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: FRANK VAN DAMME <frank.vandamme@student.kuleuven.ac.be>
Cc: linux-lvm@sistina.com

  
  
> Hello,
  
> I have a quick question. I have been running lvm on my system for a while, it
> works very good. However, the motherbord is wearing and the thing refuses to
> boot. Can I, if I put my hard disk in another system, mount the lvm volumes on
> it? I need my data right now...
  
> Normally the drive is on hda, but it will certainly have another adresse in my
> other box, since I only have athlon-optimised kernels on the faulty box and
> the only other useable machine I have is a p133, which has to boot from a
> smaller disk (1024 cylinder limit you see). My root filesystem is not in the
> lvm volume.

LVM  can mount volumes even if the harddrives have changed order.


> Frank
 
> P.S. I am NOT on the LVM mailing list, so could you please CC me? Thanks.
