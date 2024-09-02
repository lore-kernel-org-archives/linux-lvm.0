Received: from i8kolab13.kolab.citrin.ch (i8kolab13.kolab.citrin.ch [62.12.149.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965143A1CD
	for <linux-lvm@lists.linux.dev>; Mon,  2 Sep 2024 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.12.149.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725256510; cv=none; b=uOsOGOBkDLa3YJNgbDhJ41/XsdHAUYOkqNnrZYQVZZlchHTPuYhDnXz7zAyvi7OHOwc34VrRevSWsbUfrKgRPNUAtVCw7+38pboImC89H37/8GlxFJ8Yl42uJcPUEVm3Y4eZ5UkONmpvXBUZ/XpaxL9QCTw4Sp/39YTHXYz0EXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725256510; c=relaxed/simple;
	bh=XXgDljPrLjIkyWskLl5pLff9fQWk4OmmHl2n831rjJ0=;
	h=MIME-Version:Content-Type:Date:From:To:Subject:In-Reply-To:
	 References:Message-ID; b=EaIPZnrv5ABPVmhChkNg98bzKr/ztPOfhCCj+neq2oyRw+Byo+ZQys6z4tupLmwYqxXnjx5+E01EeRhN6dOPCt0ginVHhKxysEV9GEac2F0woVXy2/Us77jlXsN6xocsvYglywVFvnBP6bHTOiP4T1bBmMgFc/uIC8zlp5vB3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rubin.ch; spf=pass smtp.mailfrom=rubin.ch; arc=none smtp.client-ip=62.12.149.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rubin.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rubin.ch
X-Original-Recipient: linux-lvm@lists.linux.dev
DKIM-Filter: OpenDKIM Filter v2.11.0 i8kolab13.kolab.citrin.ch C3B97400B8E3
X-Sender: listen@rubin.ch
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Sep 2024 07:48:53 +0200
From: "box, listen" <listen@rubin.ch>
To: linux-lvm@lists.linux.dev
Subject: Unsubscribe
In-Reply-To: <3ef32ba1-ad5d-4236-8eed-22ec283ce74b@uls.co.za>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
 <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
 <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
 <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
 <e15546bf-dd1c-4a54-92bc-b9604194ffcd@gmail.com>
 <8627b66a-1774-4828-aae6-e5d31356fe10@uls.co.za>
 <52f4696f-9c03-4fea-b265-97448fbab24d@gmail.com>
 <3ef32ba1-ad5d-4236-8eed-22ec283ce74b@uls.co.za>
Message-ID: <1e7bbb4cc4742827adeade8f8aff0843@rubin.ch>
X-Sender: listen@rubin.ch

Unsubscribe
-- 
