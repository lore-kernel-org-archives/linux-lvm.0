Message-ID: <3F9D3C4B.6050809@elitedvb.net>
From: Felix Domke <tmbinc@elitedvb.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64
 kernel
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com> <3F9C0AC9.6050805@elitedvb.net> <20031027120104.K848@sistina.com> <3F9D327C.6020102@elitedvb.net> <20031027160955.M848@sistina.com>
In-Reply-To: <20031027160955.M848@sistina.com>
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
Date: Mon Oct 27 09:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

oh well, i just used 64bit versions of vgscan and vgchange, and it works 
then. must be definitely a 32/64bit problem. (i didn't realized that i 
had of course to re-run vgscan and vgchange before :/ ).


as i don't understand the 32bit->64bit ioctl wrapping (with pointers) i 
don't know how it is supposed to work with 32bit userspace tools. If you 
still want to have access to the machine, contact me.


Felix
