Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 20 Apr 2001 15:21:26 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: AGAIN: [linux-lvm] Kernel 2.4 -- invalid i/o protocol version
Message-ID: <20010420152126.H569@tykepenguin.com>
References: <01042010515703.03328@pc-silva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01042010515703.03328@pc-silva>; from silva@athenea.ort.edu.uy on Fri, Apr 20, 2001 at 10:48:46AM -0300
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Apr 20, 2001 at 10:48:46AM -0300, Ernesto Silva wrote:
> Hi guys, I'm posting this again, if anyone has any idea, please let me know, I
> need make lvm work.
> Thanks
> 
> 	I'm having some trouble trying to make LVM work.
> 
> 	I've recently installed  a new server, runing RedHat 7.0. I have also
> installed 2.4 kernel with LM support.
> 
> 	Then I  have downloaded lvm-0.8final from the sistina ftp site, then I
> compiled it (I also included the patch) and I installed it. (well, no eveything
> was so smoothly, but it's installed now).
> 
> 	I can load the lvm-module fine, but when I run vgscan or pvcreate (I
> also created a 0x8e type partition in my primary scsi disk) it complains saying
> that:  "vgscan -- invalid i/o protocol version"
> 
> 	Do you have any ideas how to fix it?

The 2.4 kernel has LVM 0.9 in it, not 0.8 so you need to download the 0.9.1beta
tools.

It's also a good idea to patch the kernel up to beta7 too. If you download the
0.9.1beta7 tarball it has all you need in there.

-- 

patrick
