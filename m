From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Availabality of LVM on IA64???
Message-ID: <20020603134745.GA9122@tykepenguin.com>
References: <A11077E28200D51182EA00D0B7755253482045@xin02.india.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A11077E28200D51182EA00D0B7755253482045@xin02.india.hp.com>
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
Date: Mon Jun  3 08:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 03, 2002 at 06:46:35PM +0530, LAKSHMIPATHY,ARUN (HP-India,ex2) wrote:
> Hi,
> 
> Wanted to check out if 1.1-rc2 supports IA64 platform or not. When I try and
> build the lvm lib from the 1.1-rc2 sources i get a lot of integer to pointer
> type cast warnings, hence I have this doubt could not find any release
> notes/docs which mention anything about IA64 support.  Need  to know if IA64
> support is available on 1.1 or not, else is there any beta that I can try
> out?? 


I've not tried LVM on IA64 but I know for certain that 1.0.4 works fine on
Alpha. The type cast warning are all in logging/debugging statements.

patrick
