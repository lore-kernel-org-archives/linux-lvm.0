Message-ID: <3FE68CE7.2030408@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.4 LVM1 devfs  -> 2.6.0 LVM2 devfs
References: <1071837164.7460.37.camel@Chimay.bugfactory.org> <20031219132513.GA1197@tykepenguin.com> <3FE42022.6060301@wanadoo.fr> <20031220155700.GB21133@tykepenguin.com>
In-Reply-To: <20031220155700.GB21133@tykepenguin.com>
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
Date: Mon Dec 22 00:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Patrick

Thank yo, I'll try to implement the same installation on my system (no 
Debian).

Best regards.

Francis

Patrick Caulfield wrote:

>On Sat, Dec 20, 2003 at 11:10:42AM +0100, Francis SOUYRI wrote:
>  
>
>>Hi Patrick,
>>
>>I have a full ("/" is also a logical volume) LVM1 2.4 devfs system, and 
>>I want to test the LVM2 2.6 devfs kernel.
>>
>>I want to have the possibility to boot the 2.4 or the 2.6 kernel with 
>>the same filesystems.
>>
>>You say "lvm-common will detect whether you have device-mapper or LVM1 
>>in the kernel and use the appropriate LVM tools". What is lvm-common ? 
>>And if lvm-common can use the appropriate LVM tools how to install the 
>>LVM1 and LVM2 tools in the same filesystem ("same" binaries)
>>    
>>
>
>lvm-common is the Debian package that switches between LVM versions on the
>same system. If you install the "lvm10" or "lvm2" packages then this will get
>installed by default.
>
>The Debian LVM binaries get installded lib /lib/lvm-<version> and lvm-common
>decides at run-tim which one is the most appropriate to use.
> 
>Of course you must use the Debian packages to get this, if you build your own
>tools from source then you're on your own :) (building your own kernels is fine
>though)
>  
>
