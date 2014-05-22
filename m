Message-ID: <537DA245.3090002@redhat.com>
Date: Thu, 22 May 2014 09:07:49 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>	<537AFE2A.50704@redhat.com>
	<CAA-yautpYCJ3GkHdDkovoMm+m-6JOo=2L9CUFdF+EY0HPdaLNw@mail.gmail.com>
In-Reply-To: <CAA-yautpYCJ3GkHdDkovoMm+m-6JOo=2L9CUFdF+EY0HPdaLNw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Setting readahead for Logical Volumes via udev
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, dwittman@gmail.com

On 05/20/2014 05:37 PM, David Wittman wrote:
> Hey Peter,
>
> Thanks for the response. I've previously tried the "change" action, and
> adding the specifier for the DM_ACTIVATION environment variable had no
> effect. I'm also aware of the capability to set the readahead on a
> per-volume basis, but I'm looking for a solution which handles setting
> these values at boot time and/or volume creation time.

Hi David, may be I do not understand your requirements but the 
`--readahead` option does set the parameter at volume creation time and 
during boot time.

Seeing you use star in the rules, looks like you want to change default 
when new LV is created: there is `readahead` setting in the lvm.conf 
file to do that.

-- Martian
