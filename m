From: "DJ TweeQ" <djtweeq@hotmail.com>
Mime-Version: 1.0
Message-ID: <F72QD6ue9Ol97tndcne000139d5@hotmail.com>
Subject: [linux-lvm] Howto Upgrade/Install LVM 1.0.6 patch on Redhat 8.0
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
Date: Mon Feb 17 17:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sup peeps! :)

I am currently running LVM 1.0.3 and have been using LVM since Redhat 7.1 
and I would like to Upgrade/Install LVM to 1.0.6 on Redhat 8.0 to support 
2TB LV's...? I was proceeding along fine until i was about to install the 
patch and have concerns regarding the documentation and whether or not the 
upgrade is possible with Redhat 8.0 and HOWTO if different than the 
instructions and also hopefully without any data loss? (I mounted and 
converted the old ext2 lvm's to ext3 lvm's and everything is ok so far but i 
would like to increase capacity beyond 240gigs per volume. Also have a 
concern regarding mounting a 2nd LV on another system via NFS which i'll 
refer to later in this post? :)

so we were getting along just fine until...
the INSTALL doc under PATCHES says...

>"This patch will be suitable for applying to a clean kernel from Linus.
>The kernels supplied with popular distributions (eg, RedHat) are not
>Linus kernels."

Not sure if this has been rectified or not but isn't the above stating  that 
the patch it is not possible on Redhat distributions?

Also in the same doc:

>"Applying the patch to a 2.4 kernel
>----------------------------------
>
>linux-2.4 contains LVM already so the patch for these kernels does
>little more than update the lvm source files.  You only need to apply
>the one patch."

does this not contradict the instructions on the HOWTO webpages?
ie.
http://tldp.org/HOWTO/LVM-HOWTO/x298.html
http://tldp.org/HOWTO/LVM-HOWTO/buildlvmpatch.html

So the question is...is it possible without messing anything up? And if 
so...is there clear documentation somewhere on such (because i haven't found 
anything 100% straightforward yet) :) or can someone who has done this with 
Redhat 8.0 (running the latest kernel) let me know if/what should be done to 
install the patch and avoid any messups? :)

please? :)




_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.  
http://join.msn.com/?page=features/featuredemail
