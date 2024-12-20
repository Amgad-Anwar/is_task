<?php

namespace App\Http\Resources;

use App\Models\Customer\CustomerPackage;
use App\Models\Customer\SubscriptionTransaction;
use App\Models\PackagePrice;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class CustomerResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {




        return [
            'id' => $this->id,
            'name' => request()->header('lang') == 'ar' ? $this->name_ar : $this->name_en,
            'dob_hijri' => $this->dob_hijri,
            'mobile' => $this->mobile,
        ];
    }
}
