Message-ID: <3DC7FF36.3000504@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] enterprise kernel
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
Date: Tue Nov  5 11:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

My company uses a software package that 'requires' a RedHat Enterprise 
kernel.  The word 'requires' is in quotes as it doesnt seem to be 
required other than by the vendor's policy.  They wont support it if 
it's not enterprise, although the software seems to function just fine.

The problem I'm running into, is that LVM doesnt seem to be included in 
the enterprise build available from RedHat in rpm format.    I know I 
can build my own enterprise kernel, but I'm an RPM rookie (in the 
context of creating them).

I am curious if anyone out there knew of a workaround or a pre-existing 
config file that I can plug into my kernel source or rpm spec file that 
will provide the compile options and/or modules for LVM to function 
correctly in a 2.4 enterprise kernel?  The whole idea of kernels in 
pre-configured in rpm format makes me shudder, but I have to do what I 
have to do in order to get things working.

aTdHvAaNnKcSe
