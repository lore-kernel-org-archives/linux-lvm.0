From: Tom Brown <thecap@mail.utexas.edu>
Subject: Re: [linux-lvm] lvm and Debian
Message-Id: <20020118111828.GS6323@peach.ece.utexas.edu>
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <20020118104418.GA29876@balu.kawo2.rwth-aachen.de>
    <E16RWih-0000HQ-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16RWih-0000HQ-00@arwen.dev33.cvf>
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
Date: Fri Jan 18 05:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 11:58:03AM +0100, Pierrick PONS wrote:
> There's a thing I don't understand : is the lvm_1.0.1rc4 patch still in the 
> 2.4.17 kernel or do I have to patch my 2.4.17 kernel to use lvm and lvm 
> commands ?
> 
> I thought that using a 2.4.17 kernel permitted to have lvm fonctionalities and 
> not to be obliged to patch the kernel.

I downloaded the kernel source with
apt-get install kernel-source-2.4.16

Then downloaded the lvm source and followed the instructions in 
README and INSTALL to patch the kernel and build and install the lvm tools.

Then I followed the instructions at
http://www.google.com/search?num=100&hl=en&q=debian+kernel+source
to build and install the patched kernel the debian way.

Seemed to work without a major problem.


-- 
mailto:thecap@usa.net
http://www.ece.utexas.edu/~thecap/
28 70 20 71 2C 65 29 61 9C B1 36 3D D4 69 CE 62 4A 22 8B 0E DC 3E
