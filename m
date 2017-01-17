References: <31656092.220.1484595977477.JavaMail.kgoods@Ken-PC>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <afb0ab23-80bd-97bc-4e87-0e4e65e5196e@redhat.com>
Date: Tue, 17 Jan 2017 12:19:44 +0100
MIME-Version: 1.0
In-Reply-To: <31656092.220.1484595977477.JavaMail.kgoods@Ken-PC>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] multipath_component_detection
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: kgoods@cropusainsurance.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 01/16/2017 08:46 PM, Ken Goods wrote:
> Hi all,
> Just a quick question. I've been setting up a (iscsi) LUN and want to
> create an LVM PV on it.
> 
> The docs I have read are somewhat conflicted. Some say that the
> underlying devices should be filtered, however according to comments in
> lvm.conf it says that if multipath_component_detection is enabled, "LVM2
> will ignore devices used as component paths of device-mapper multipath
> devices".
> 
> So filtering is no longer necessary with LVM2?
> 

The multipath component detection is an automatic filter in LVM2 (if
enabled with devices/multipath_component_detection=1 in LVM
configuration - that is used by default). So in this case you don't need
to set up devices/global_filter (or devices/filter) manually. LVM will
filter multipath components automatically by looking at the device stack
and if it detects that there's a multipath device on top of certain set
of devices, such devices are assumed as multipath components and they're
filtered automatically.

Of course, for this automatic filter to work correctly, you also need to
have your multipath correctly configured - LVM doesn't know that the
devices are multipath components unless there's multipath device already
set up and running on top of those components.

However, there's one improvement in this detection if you use
devices/external_device_info_source="udev" in your LVM configuration
(this is not used by default yet). In this case, LVM reads information
from udev database which in turn has this information about multipath
components directly from multipath and that one takes this information
from its own configuration (the component WWID list in multipath's
configuraton) - so in this case you don't even need to have multipath
device set up yet on top of multipath components for LVM to detect
multipath components properly.

But usually, if your system is properly configured, you always have
multipath device set up and running on top of multipath components.

-- 
Peter
