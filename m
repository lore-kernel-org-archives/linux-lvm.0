From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] lvm and Debian
Message-Id: <20020118115639.GA30348@balu.kawo2.rwth-aachen.de>
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
Date: Fri Jan 18 05:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 11:58:03AM +0100, Pierrick PONS wrote:
>
> There's a thing I don't understand : is the lvm_1.0.1rc4 patch still in the 
> 2.4.17 kernel or do I have to patch my 2.4.17 kernel to use lvm and lvm 
> commands ?

There is some kind of LVM 1.0.1rc4 (therefore called 1.0.1rc4(ish)) in
kernel 2.4.17.

> I thought that using a 2.4.17 kernel permitted to have lvm fonctionalities and 
> not to be obliged to patch the kernel.

No, you don't *need* to patch the kernel to have LVM. It's in the
kernel, just in an older version.

Regards, Markus

-- 
Free the Fluffy Bunny.
