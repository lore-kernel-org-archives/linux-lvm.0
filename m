Date: Thu, 18 Oct 2001 17:48:18 +0100
Subject: Re: [linux-lvm] SnapRestore software on NetApp
Message-ID: <20011018174818.C849@btconnect.com>
References: <0110181646580Y.24876@in-cadcae4>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0110181646580Y.24876@in-cadcae4>; from emanuel.quass@temic.com on Thu, Oct 18, 2001 at 04:46:58PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Oct 18, 2001 at 04:46:58PM +0200, Emanuel Quass wrote:
> Hi,
> 
> 
> first of all I want to thank the developers for the work they have done up to 
> now!
> 
> But to come to business, I have to write a comparison between Linux  and 
> NetApp Filers. (Is there anything already somewhere available?)
> 
> I saw something about a "SnapRestore software" which means that it is 
> possible to revert a snapshot back to the filesystem in some minutes!
> My question: Is this possible with LVM and reiserfs too?

I'm not sure what you mean by 'reverting a snapshot back to the
filesystem', but dropping a snapshot takes very little time (seconds).

- Joe
